import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { AppContainer } from 'react-hot-loader';
import { createStore, applyMiddleware } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';

const render = Component => {
    ReactDOM.render(
        <AppContainer>
            <Component/>
        </AppContainer>,
        document.body
    )
}

class MainContent extends Component {
    constructor(){
        super();
    }

    render(){
        return <div>Hello World</div>
    }
}

render(MainContent);

if(module.hot){
    module.hot.accept(null, () => { render(MainContent) })
}



const store = createStore(()=>{}, composeWithDevTools());