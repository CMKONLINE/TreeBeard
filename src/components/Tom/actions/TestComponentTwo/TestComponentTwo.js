import { createAction } from 'redux-actions';

export const testComponentTwo = createAction('TEST_COMPONENT_TWO');

export const actionCreator = (payload) =>{
    return testComponentTwo(payload);
}