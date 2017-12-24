import { handleActions } from 'redux-actions';
import  * as actions from './actions';

let defaultState = {};

export const reducer = (()=>{
     let handlers = {};
     Object.entries(actions).map(([name,functions])=>{
        handlers[name] = functions.handlers
     })
     return handleActions(handlers,defaultState);
 })()