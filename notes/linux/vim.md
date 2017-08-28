# VIM 使用教程
## Vim Script
### autocmd关键字
**Usage:** `autocmd event pattern cmd`   
> event为监控的事件  pattern针对事件过滤的模式  cmd执行的命令  多事件用逗号隔开  
> event:BufNewFile,BufRead,BufWritePre FileType(使用help autocmd-events查看相关事件)  
 **autocmd命令会复制，每次刷新配置文件都将命令复制一份，当事件发生后动作会执行多次， 解决方法：autocmd!**

**augroup:** autocmd组  

	augroup testgroup
		autocmd!       //清除之前的同名组消除复制，没有这个会之前同名组组合
		autocmd xxxx
		autocmd xxxx		
	augroup END   

### 输出
	echo          //底行回显
	echom         //底行回显并缓存 可用message查看
	message       //查看缓存输出

### 快捷键映射
	map,nmap,imap,vmap,omap...  //设置快捷键  
	unmap,nunmap,iunmap...      //取消快捷键 help 查看更多相关信息 
    noremap，nnoremap...        //非递归快捷键    <buffer>局部映射 <nop>无操作键   omap==operator-pending mapping

### 缩写
	iabbrev [<buffer>] adn and     //插入模式缩写  插入模式输入adn再敲空格回自动替换成and   []内容为可选，表作用域

### 设置选项值
	set, setlocal  //设置选项值

### 执行命令
	execute “string”  //串当命令执行
	normal xxxx       //在normal模式敲击xxxx
	normal! xxxx      //忽略xxxx的映射 作用类似normal xxxx   且不能解析<cr>回车键（execute "normal! gg/foo\<cr>dd"  可解决此问题）

### 字符串
	echo 'that''s enough'   // this's enough  ''特例
	ehco '//'               // /   ''不解析特殊字符 字面意义串
	echo "//"               // //   ""解析特殊字符
	注: . + 连接串

### 变量
	let &number                //optional variable  
	let &l:number              //local optional  
	let @a = "hello"           //register variable    @"复制存的寄存器变量  @/搜索/xxx时用  
	//字符串转整形：以数字开头正确转换开头连续数字，否则得0
	//help internal-variables

### 条件选择
**if:**
	
	if condition
		xxx
	endif      
**if-elseif-else:**
	
	if condition 
		xxx 
	elseif 
		xxx 
	else 
		xxx 
	endif

### 运算符
==? //大小写不敏感比较  忽略set ignorecase  
==# //大小写敏感比较  忽略set ignorecase         help expr4  
>set ignorecase 控制是否大小写敏感，用作比较


### 函数
> function关键字定义函数，函数名必须以大写字母开头，无返回值时默认返回0, 用call关键调用函数  
  使用a:argname引用参数, a:N引用可变参数

示例: 

	function FuncName(foo,...)
	    echo a:foo        // foo第一参数可选
	    echo a:0          // 可变参数的数量
	    echo a:1          // 可变参数的第一个参数  a:N依次类推
	    echo a:000        // 可变参数列表，仅在echo时被设置可变参数列表  echom时为空
	endfunction
	call FuncName(argFoo, varArg1,varArg2)   // 函数调用

### Vim API
	substitute                              // 等价于s/xx/xx/g 替换命令



## Vim 使用
### 折叠
zm{motion}   创建折叠
zc           关闭折叠
zo           打开折叠  


## 常用配置
	“对于布尔选项配置，配置名前加no取。 如set nu, set nonu, set wrap, set nowrap
	colorscheme desert     "颜色主题 
	"快捷键前缀
	let mapleader=“,”      "映射前缀
	let maplocalleader="," "指定的文件类型有效
	
	au BufNewFile,BufRead *.npl,*page setf lua "文件关联

	set completeopt=longest,menu,preview  "代码补全选项
	"文件编码
	set encoding=utf-8     “Vim 的内部编码
	set termencoding=utf-8 "Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
	set fileencoding=utf-8 "Vim 当前编辑的文件在存储时的编码
	set fileencodings=ucs-bom,utf-8,gbk,default,latin1 "Vim 打开文件时的尝试使用的编码
	"单行过长时不自动换行 
	set nowrap       "超过窗口宽度不自动换行  "set wrap        "超过窗口宽度自动换行  
	“set numberwidth // 设置行号宽度
	"set textwidth   "设置每行文本宽度
	set cmdheight=2       "命令行高度
	"设tab键为4个空格
	set expandtab      "将tab扩展成空格  set noexpandtab
	set tabstop=4      "定义tab为4个空格
	set softtabstop=4  "tab键自适应, softtabstop = N * tabstop + M(空格)， 如：当softtabstop = 6时，按下tab键将插入一个制表符合两个空格
	set shiftwidth=4   "程序自动缩进的宽度
	"set autoread      "文件外部修改自动加载
	"标签页
	"set showtabline=1
	set laststatus=1   "启动显示状态行1 总是显示状态行2 
	set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} 
	"插入模式方向键快捷键
	inoremap <c-h> <left>
	inoremap <c-l> <right>
	inoremap <c-j> <down>
	inoremap <c-k> <up>
	"显示文件行号
	set nu
	set rnu        "显示相对行号 cursor行为0 上下行依次递增
	"set paste     "粘贴缩进问题 set nopaste 
	set pastetoggle=<F2> "paste <=> nopaste 开关
	"句法检查
	filetype plugin indent on
	syntax on
	
	nnoremap <leader>ev :vsplit ~/.vimrc<cr> "普通模式非递归映射:编辑~/.vimrc
	nnoremap <leader>sv :source ~/.vimrc<cr> "普通模式非递归映射:更新~/.vimrc

	"自动补全
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP  "自动补全php
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS  "自动补全css
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags "自动补全html 
	
	"补全背景色    
	"highlight Pmenu    guibg=black  guifg=black  
	"highlight PmenuSel guibg=black guifg=black  
	"补全背景色 终端  
	"highlight Pmenu    ctermbg=darkgrey  ctermfg=black  
	"highlight PmenuSel ctermbg=lightgrey  ctermfg=black  
	
	“常用插件
	"bundle vim插件管理插件
	"The-NERD-tree 文件浏览器
	"Plugin 'phpcomplete.vim'
	"Plugin 'fatih/vim-go' "vim IDE插件
	"Plugin 'Valloric/YouCompleteMe' "多语言支持IDE补全插件
	"Plugin 'Auto-Pairs'             "括号匹配
	"Plugin 'ctrlp.vim'              "文件搜索
	"Plugin 'grep.vim'               "搜索插件
	# lua 自动补全插件
	"Plugin 'xolox/vim-misc'                                            |~                                                                  
	"Plugin 'xolox/vim-lua-ftplugin'
	#------------

## Vim扩展
	ctrlp          优雅的地打开源代码  
	nerdtree       优雅的地浏览文件目录  
	snipmate       优雅的代码自动片断  
	supertab       优雅的代码补全  
	tabular        优雅的对齐  
	tagbar         优雅的outline  
	css-color      优雅的在vim里查看css颜色  
	vim-fugitive   优雅的在vim里使用git  
	vim-powerline  很美观实用的状态栏  
	vim-surround   优雅的编辑tag  
	vundule        优雅的管理你的vim插件  
	vimwiki        优雅的内建wiki  
	colorselector  优雅的像女人试衣服一样试配色  


## 问题
1. vim打开dos格式文件时，可能会报^M(C-V C-M)等无法识别错误:
   解决方法:

		执行vim命令
		set fileformat=unix
		%s/^M//g  

2. vim支持lua：
	安装vim-nox即可: apt-get install vim-nox  





# vim
## vundle管理插件
>地址 https://github.com/VundleVim/Vundle.vim

安装步骤:  
1 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
2 配置vimrc  
```
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" let Vundle manage Vundle required! 
Bundle 'VundleVim/Vundle.vim'
" Plugin List
" Plugin 'ctrlp.vim'
" All of your Plugins must be added before the following line
filetype plugin indent on    " reqiored
" }
```

3 vim中执行:PluginInstall或者命令行中执行：vim +PluginInstall +qall

>常用插件:  
>Plugin 'AutoComplPop' # 自动补全
>Plugin 'ctrlp.vim'    # 文件搜索  
>Plugin 'The-NERD-tree' # 目录树  
>Plugin 'Auto-Pairs'    # 括号匹配  
>Plugin 'https://github.com/Lokaltog/vim-powerline.git' # 状态栏  
>Plugin 'mattn/emmet-vim'  # html 插件
>Plugin 'scrooloose/nerdcommenter' # 注释插件

## 常用插件用法
### Plugin 'scrooloose/nerdcommenter'  注释插件
```
<leader>cc   # 注释当前行或选择行   类似效果 <leader>cn  <leader>cs <leader>cy
<leader>cu   # 解除注释
<leader>c<space>  # 注释非注释切换  类似效果 <leader>ci
```

### vim-surround 插件
ys  # 添加
cs  # 转换 
ds  # 删除 
etc: ys2w" 两个单词加双引号


##  vim常用配置
[个人vim配置文件](https://github.com/wxaxiaoyao/notebook/blob/master/vim/vimrc)

## vim 配置目录
- /etc/vim
- /usr/share/vim   `# /usr/share/vim/vim74/filetype.vim 文件类型脚本`
- $HOME/.vim 

## TODO
- 字典补全

## 参考
https://github.com/ruanyl/bigvim  
https://github.com/ruanyl/bigvim/blob/master/vimrc.bundles

## vim 基本知识
### 文本选择
- [a|i][w|W|s|p]
- % 配对

### marker折叠
- zf创建折叠
- df删除折叠
- zc关闭折叠
- zo打开折叠