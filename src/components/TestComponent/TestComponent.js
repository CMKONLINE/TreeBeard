import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class TestComponent extends Component{
    constructor(){
        super();
    }

    render(){
        return <div>TestComponent</div>
    }
}

//Prop Definitions for this component
TestComponent.propTypes = {}