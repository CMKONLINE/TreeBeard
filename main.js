import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { AppContainer } from 'react-hot-loader';
import { createStore, applyMiddleware,combineReducers } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import PropTypes from 'prop-types';
import { Provider } from 'react-redux';
import {TomModule} from './src/components/index.js'
import * as ComponentModules from './src/components'

let Apples = TomModule.container;



const componentReducers = ()=>{
    let reducers = {}
    Object.entries(ComponentModules).map(([name,components])=>{
        reducers[name] = components.reducer;
        console.log(reducers)
    })
    return combineReducers(reducers);
}

console.log(componentReducers());

const store = createStore(componentReducers(), composeWithDevTools());

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
        return  <Provider store={store}>
                <Apples />
            </Provider>
    }
}

MainContent.propTypes = {
    
}

render(MainContent);

if(module.hot){
    module.hot.accept(null, () => { render(MainContent) })
}


