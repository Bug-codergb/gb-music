import { ISearchStore } from '../../../../../../constant/store/search';

interface ISearchAction {
  type: string;
  searchResult: ISearchStore;
}
export type { ISearchAction };
