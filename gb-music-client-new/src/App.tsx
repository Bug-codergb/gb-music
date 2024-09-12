import React, { FC, Suspense } from 'react';
import { ConfigProvider } from 'antd';
import { Provider } from 'react-redux';
import zhCN from 'antd/locale/zh_CN';
// for date-picker i18n
import 'dayjs/locale/zh-cn';
//import 'antd/dist/antd.css';
import store from './store';
import routes from './router';
import { HashRouter, useRoutes } from 'react-router-dom';

import './assets/css/base.css';
import './assets/css/cropper.css';
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
            <ConfigProvider
              locale={zhCN}
              theme={{
                token: {
                  colorPrimary: '#ec4141'
                },
                components: {
                  Slider: {
                    handleColor: '#ec5e5f',
                    handleActiveColor: '#ec4141',
                    dotActiveBorderColor: '#ec5e5f',
                    trackBg: '#ec5e5f',
                    trackHoverBg: '#ec4141',
                    dotBorderColor: '#ec5e5f',
                    handleActiveOutlineColor: 'rgba(219, 103, 100,.2)',
                    colorPrimaryBorderHover: '#ec5e5f'
                  }
                }
              }}
            >
              <RouteElement />
            </ConfigProvider>
          </Suspense>
        </HashRouter>
        {/*<Toast />*/}
        {/*<Message />*/}
        {/*<Footer />*/}
      </Provider>
    </AppWrapper>
  );
};

export default App;
