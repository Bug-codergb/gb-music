import {configureStore} from "@reduxjs/toolkit"

import { reducer as loginReducer } from '../views/Login/store/index';
// import { reducer as songReducer } from '../components/content/playCoin/store/index';
// import { reducer as videoReducer } from '../components/content/detail/videoDetail/store';
import { reducer as searchReducer } from '../components/content/topBar/childCpn/searchMatch/store/index';
 import { reducer as toastReducer } from '../components/common/toast/store/index';
import { reducer as messageReducer } from '../components/common/message/store/index';
// import { reducer as programReducer } from '../components/content/detail/channelDetail/childCpn/programs/store/index';
// import { reducer as playModeTypeReducer } from './playType/index';
// import { reducer as vipReducer } from '../components/content/vip/store/index';
const store = configureStore({
  reducer:{
    loginReducer,
    toastReducer,
    messageReducer,
    searchReducer
    /*songReducer,
    videoReducer,

    toastReducer,
    ,
    programReducer,
    playModeTypeReducer,
    vipReducer*/
  },
  devTools:true
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch
export default store;
