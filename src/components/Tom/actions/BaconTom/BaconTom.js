import { createAction } from 'redux-actions';

export const BaconTom = createAction('BACONTOM');

export const actionCreator = (payload) =>{
    return BaconTom(payload);
}

export const handlers = {
    [ BaconTom ] : (state,action)=>{
        return {...state};
    }
}
