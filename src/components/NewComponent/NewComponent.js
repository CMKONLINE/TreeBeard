import React, { Component } from 'react';
import PropTypes from 'prop-types';

export  class NewComponent extends Component{
    constructor(){
        super();
    }

    render(){
        return <div>NewComponent component</div>
    }
} 

//Prop Definitions for this component
NewComponent.propTypes = {}
