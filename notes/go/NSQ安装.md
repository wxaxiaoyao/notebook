## NSQ linux安装教程

### 一、环境依赖
* golang 版本1.4+(自行安装，本本不做介绍)
* gpm    依赖管理器

### 二、编译、安装
1. gpm安装([gpm源码地址](https://github.com/pote/gpm))  
		
		cd $GOPATH/src                                                          # linux传统安装方法
 		git clone https://github.com/pote/gpm.git && cd gpm
		git checkout v1.4.0 # You can ignore this part if you want to install HEAD.
		./configure
		make install
2. nsq安装 
		
		mkdir -p $GOPATH/src/github.com/nsqio;cd $GOPATH/src/github.com/nsqio   # 创建并进入关联目录
		git clone https://github.com/nsqio/nsq.git && cd nsq                    # 下载源码并进入源码目录
		gpm install                                                             # 安装依赖包编译项目 会生成执行文件 可自行复制到PATH目录下就不必执行go install ./...命令
		./test.sh                                                               # 测试编译结果
		go install ./...                                                        # 安装执行文件到$GOBIN目录

### 三、开启NSQ
1. nsqd节点维护进程：nsqlookupd &
2. nsqd节点进程：nsqd --lookupd-tcp-address=127.0.0.1:4160 &
3. nsqd后台管理进程：nsqadmin --lookupd-http-address=127.0.0.1:4161 &
>nsqlookupd与nsqadmin为辅助进程，可不使用直接用nsqd也可正常工作. 这里开启的进程均用默认的端口


### 四、工具测试
	#生产者: 产生一个topic为“test” 消息内容为“hello world”的消息
	curl -d 'hello world 1' 'http://127.0.0.1:4151/put?topic=test'          
    #消费者: 将topic为“test”的消息写到./tmp目录下的一个文件中
	nsq_to_file --topic=test --output-dir=./tmp --lookupd-http-address=127.0.0.1:4161  

### 五、示例代码
	package main
	
	import (
	    "fmt"
	    "time"
	
	    "github.com/nsqio/go-nsq"
	)
	
	// nsq发布消息
	func Producer() {
	    p, err := nsq.NewProducer("127.0.0.1:4150", nsq.NewConfig())                // 新建生产者
	    if err != nil {
	        panic(err)
	    }   
	　　
	    if err := p.Publish("test", []byte("hello NSQ!!!")); err != nil {           // 发布消息
	        panic(err)
	    }   
	}
	
	// nsq订阅消息
	type ConsumerT struct{}
	
	func (*ConsumerT) HandleMessage(msg *nsq.Message) error {
	    fmt.Println(string(msg.Body))
	    return nil 
	}
	
	func Consumer() {
	    c, err := nsq.NewConsumer("test", "test-channel", nsq.NewConfig())   // 新建一个消费者
	    if err != nil {
	        panic(err)
	    }   
	    c.AddHandler(&ConsumerT{})                                           // 添加消息处理
	    if err := c.ConnectToNSQD("127.0.0.1:4150"); err != nil {            // 建立连接
	        panic(err)
	    }   
	}
	// 主函数
	func main() {
	    Producer()
	    Consumer()
	    time.Sleep(time.Second * 3)
	}
	// 运行将会打印： hello NSQ!!!

### 六、使用总结：
单机使用条件，同步发布消息速度也非常快(10w/s)，发布消息端基本无需再做缓存封装。接收端的消息处理应耗时尽量的短，避免消息积累，当消息积累到NSQ的缓存的数量会将多余的消息写到文件，此时也会减缓发送端的发送速度，因此，对接收端可使用channel和go routine做简单封装处理。若某topic消息产生太快太多也可将其单独使用一个nsqd处理，避免消息积累影响其它消息投递与接收。