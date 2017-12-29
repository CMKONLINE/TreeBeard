bold=$(tput bold)
normal=$(tput sgr0)

echo "The Magical Creator has been Awoken. What would you like to create?"
echo " 1. ${bold}component [c]${normal}"
echo " 2. ${bold}container [ct]${normal}"
echo " 3. ${bold}reducer [r]${normal}"
echo  " 4. ${bold}action [a]${normal}"
read type 
if [ $type == "1"  -o  $type == "component"  -o $type == "c" ];
    then echo "Okay, what would you like to name the Component?"
    read componentName
    echo "Creating Component : $componentName"
    echo "What directory does this component live (leave blank for cwd)"
    read directory
    if [ $directory ];
        then cd $directory
    fi
    module=$componentName'Module'
    echo "export * as $module from './$componentName'" >> index.js
    mkdir $componentName && cd $componentName
    mkdir "__tests__"
    touch "__tests__/$componentName-test.js"
    touch index.js
    touch "$componentName.js"
    echo "import React, { Component } from 'react';
import PropTypes from 'prop-types';

export  class $componentName extends Component{
    constructor(){
        super();
    }

    render(){
        return <div>$componentName component</div>
    }
} 

//Prop Definitions for this component
$componentName.propTypes = {}" >> $componentName.js
    echo "var React = require('react');
var expect = require('expect');
import { shallow } from 'enzyme';
import { component as $componentName } from '../'
import Enzyme from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

Enzyme.configure({ adapter: new Adapter() });

describe('$componentName Component', function () {
  it('renders without problems', function () {
    const wrapper = shallow(<$componentName />);
    expect(wrapper.length).toEqual(1)
  });
});" > "__tests__/$componentName-test.js";
    echo "export { $componentName as component } from './$componentName.js'" >> index.js
    echo "Finished creating Component : $componentName"
fi

if [ $type == "2"  -o  $type == "container"  -o $type == "ct" ];
    then echo "Okay, what's then name of the component that this container attaches to?"
    read componentName
    echo "What directory does this component live (leave blank for cwd)"
    read directory
     if [ $directory ];
        then cd $directory
    fi
    cd $componentName
    touch container.js
    echo "import { component as $componentName } from './'; 
import {connect} from 'react-redux';
import  * as actions from './actions';
import { bindActionCreators } from 'redux';

const mapStateToProps = (globalState, ownProps = {}) => {
    const pageState = globalState.$componentName
    return {...pageState};
  }

const mapDispatchToProps = (dispatch,ownProps) => {
    let boundActions = {};
    Object.entries(actions).map(([name,functions])=>{
        boundActions[name] =  functions.actionCreator;
    })
    return bindActionCreators(boundActions,dispatch);
}

export const container =  connect(mapStateToProps, mapDispatchToProps)($componentName)" >> container.js
    echo "export { container } from './container.js'" >> index.js
    echo "Finished creating a container for component $componentName"
fi

if [ $type == "3"  -o  $type == "reducer"  -o $type == "r" ];
    then echo "Okay, what's then name of the component that this reducer attaches to?"
    read componentName
    echo "What directory does this component live (leave blank for cwd)"
    read directory
    if [ $directory ];
        then cd $directory
    fi
    cd $componentName
    touch reducer.js
    echo "import { handleActions } from 'redux-actions';
import  * as actions from './actions';

let defaultState = {};

export const reducer = (()=>{
     let handlers = {};
     Object.entries(actions).map(([name,functions])=>{
        handlers = {...handlers,...functions.handlers}
     })
     return handleActions(handlers,defaultState);
 })()" >>  reducer.js
    echo "export { reducer } from './reducer.js'" >> index.js
    echo "Finished creating a reducer for component $componentName"
fi

if [ $type == "4"  -o  $type == "action"  -o $type == "a" ];
    then echo "Okay, what's then name of the component that this action attaches to?"
    read componentName
    echo "What directory does this component live (leave blank for cwd)"
    read directory
    if [ $directory ];
        then cd $directory
    fi
    cd $componentName
    if [ ! -d 'actions' ];
        then mkdir actions && touch actions/index.js
    fi
    cd actions
    echo "What is the name of the action that you wish to create?"
    read actionName
    mkdir $actionName
    touch "$actionName/index.js"
    touch "$actionName/$actionName.js"
    actionUpper=$(echo "$actionName" | tr '[:lower:]' '[:upper:]')
    echo "import { createAction } from 'redux-actions';

export const $actionName = createAction('$actionUpper');

export const actionCreator = (payload) =>{
    return $actionName(payload);
}

export const handlers = {
    [ $actionName ] : (state,action)=>{
        return {...state};
    }
}" >> "$actionName/$actionName.js"
    echo "export * as $actionName from './$actionName'" >> 'index.js'
    echo "export * from './$actionName';" >> $actionName'/index.js';
    echo "Finished creating action $actionName for component $componentName"
fi

