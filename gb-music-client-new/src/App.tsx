import React, { FC, Suspense } from 'react';
import { Provider } from 'react-redux';
//import 'antd/dist/antd.css';
import store from './store';
import routes from './router';
import { HashRouter,useRoutes } from 'react-router-dom';

import './assets/css/base.css';
import './assets/font/iconfont.css';

import Footer from './components/content/footer';
import Toast from './components/common/toast';
import Message from './components/common/message';
import { Skeleton } from 'antd';
import './constant/global/index';
import { AppWrapper } from './App.style';

const App: FC = () => {
  function RouteElement(props: any) {
    return useRoutes(routes);
  }
  return (
    <AppWrapper>
      <Provider store={store}>
        <HashRouter>
          <Suspense
            fallback={
              <div className="app-router-loading">
                <Skeleton active paragraph={{ rows: 10 }} />
                <div className="app-router-line"> </div>
                <Skeleton active paragraph={{ rows: 10 }} />
              </div>
            }
          >
            <RouteElement/>
          </Suspense>
        </HashRouter>
        <Toast />
        <Message />
        <Footer />
      </Provider>
    </AppWrapper>
  );
};

export default App;
