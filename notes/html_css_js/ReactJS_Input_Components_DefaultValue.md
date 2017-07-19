##ReactJS 文本输入组件的默认值
问题：由于input,textarea输入组件在设置defaultValue时，仅在初始化时起作用，后面渲染时失效，导致默认值需要在请求服务器数据后再变
的比较麻烦，虽可用React可控组件编程模式解决，但会多很多零碎代码不如直接设置defaultValue来的简便。
解决：针对上述问题，如下代码对input,textarea简单包装，以实现defaultValue在二次渲染时依旧生效。
	
	import React, { PropTypes } from 'react';
	import shallowCompare from 'react-addons-shallow-compare';
	
	class Input  extends React.Component
	{
	    shouldComponentUpdate(nextProps, nextState) {
	        return shallowCompare(this, nextProps, nextState);
	    }
	
	    state = {
	        value:'',
	    }
	
	    __onChange(e) {
	        this.setState({value:e.target.value});
	        this.value = e.target.value;                         // 当父组件使用ref时，可用此值获取用户输入值，类似直接使用input的效果
	        if (this.props.onChange) {
	            this.props.onChange(e);
	        }
	    }
	
	    render() {
	        if (this.defaultValue != this.props.defaultValue) {
	            this.value = this.defaultValue = this.props.defaultValue;
	            this.state.value = this.props.defaultValue ||  ''; // 避免当defaultValue=undefined时，报如下错误：
				/*
				    Warning: <Component> is changing a uncontrolled input of type text to be controlled. Input   
				    elements should not switch from uncontrolled to controlled (or vice versa). Decide between   
				    using a controlled or uncontrolled input element for the lifetime of the component. More info:   
				    https://fb.me/react-controlled-components
				*/  
	        }
	        var props = Object.assign({}, this.props, {onChange:this.__onChange.bind(this), value:this.props.value || this.state.value});
	        delete props.defaultValue;
	
	        if (this.props.type == 'textarea') {
	            return (<textarea  {...props }/>);
	        } else {
	            return (<input  {...props} />);
	        }
	    }
	}
	
	export default Input;