import { component as NewComponent } from './'; 
import {connect} from 'react-redux';
import  * as actions from './actions';
import { bindActionCreators } from 'redux';

const mapStateToProps = (globalState, ownProps = {}) => {
    const pageState = globalState.NewComponent
    return {...pageState};
  }

const mapDispatchToProps = (dispatch,ownProps) => {
    let boundActions = {};
    Object.entries(actions).map(([name,functions])=>{
        boundActions[name] =  functions.actionCreator;
    })
    return bindActionCreators(boundActions,dispatch);
}

export const container =  connect(mapStateToProps, mapDispatchToProps)(NewComponent)
