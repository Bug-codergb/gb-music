import { Map } from 'immutable';
import { ISearchStore } from '../../../../../../constant/store/search';
import { ISearchAction } from './type';

const defaultState = Map<ISearchStore>({
  searchResult: {
    user: [],
    playlist: [],
    album: [],
    artist: [],
    video: [],
    song: []
  }
});
const reducer = (state = defaultState, action: ISearchAction) => {
  switch (action.type) {
    case 'changeSearchResult':
      return state.set('searchResult', action.searchResult);
    default:
      return state;
  }
};
export default reducer;
