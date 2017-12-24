import { createAction } from 'redux-actions';

export const NewComponentAction = createAction('NEWCOMPONENTACTION');

export const actionCreator = (payload) =>{
    return NewComponentAction(payload);
}

export const handlers = {
    [ NewComponentAction ] : (state,action)=>{
        return {...state};
    }
}
