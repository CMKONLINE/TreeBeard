import { createAction } from 'redux-actions';

export const testAction = createAction('TEST_ACTION');

export const actionCreator = (incrementVal) =>{
    return testAction({increment : incrementVal});
}

export const handlers = {
    [ testAction ] : (state,action)=>{
        let result = {...state};
        result.val = state.val ? state.val + action.payload.increment : action.payload.increment;
        console.log('here')
        return result;
    }
}