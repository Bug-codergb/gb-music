import { ISearchStore } from '../../../../../../constant/store/search';

export const changeSearchResult = (data: ISearchStore) => {
  return {
    type: 'changeSearchResult',
    searchResult: data
  };
};
