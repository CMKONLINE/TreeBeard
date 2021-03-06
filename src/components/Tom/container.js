import { component as Tom } from './'; 
import {connect} from 'react-redux';
import  * as actions from './actions';
import { bindActionCreators } from 'redux';

const mapStateToProps = (globalState, ownProps = {}) => {
    const pageState = globalState.Tom
    return {...pageState};
  }

const mapDispatchToProps = (dispatch,ownProps) => {
    console.log(actions)
    let boundActions = {};
    Object.entries(actions).map(([name,functions])=>{
        boundActions[name] =  functions.actionCreator;
    })
    return bindActionCreators( boundActions,dispatch);
}

export const container =  connect(mapStateToProps, mapDispatchToProps)(Tom)