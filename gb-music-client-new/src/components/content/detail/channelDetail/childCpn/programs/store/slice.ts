import { createSlice } from "@reduxjs/toolkit"
const programSlice = createSlice({
  name: "program",
  initialState:{
    programDetail: {},
    programURL: ''
  },
  reducers:{
    changeProgramDetail(state, {payload}){
      state.programDetail= payload;
    },
    changeProgramURL(state, {payload}){
      state.programURL = payload;
    }
  }
})
const reducer = programSlice.reducer;
const {
  changeProgramDetail,
  changeProgramURL
} = programSlice.actions
export {
  reducer,
  changeProgramURL,
  changeProgramDetail
}
