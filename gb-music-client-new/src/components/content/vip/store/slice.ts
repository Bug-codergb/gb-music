import { createSlice } from "@reduxjs/toolkit"
const vipSlice = createSlice({
  name: "vip",
  initialState: {
    isShow: false
  },
  reducers: {
    changeIsShowAction(state, action) {
      state.isShow = action.payload;
    }
  }
})
const reducer = vipSlice.reducer;
const {
  changeIsShowAction
} =vipSlice.actions
export {
  reducer,
  changeIsShowAction
}
