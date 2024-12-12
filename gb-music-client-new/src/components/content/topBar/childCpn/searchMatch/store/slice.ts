import { createSlice } from "@reduxjs/toolkit"
const searchResultSlice = createSlice({
  name:"searchResult",
  initialState:{
    searchResult: {
      user: [],
      playlist: [],
      album: [],
      artist: [],
      video: [],
      song: []
    }
  },
  reducers:{
    changeSearchResult(state,{payload}){
      console.log(payload)
      state.searchResult = payload;
    }
  }
})
const reducer = searchResultSlice.reducer;
const {changeSearchResult} = searchResultSlice.actions
export {
  reducer,
  changeSearchResult
}
