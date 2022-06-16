<template>
  <div class="order">
    <Header title="近六个月VIP开通数量" />
    <div class="order-container"></div>
  </div>
</template>

<script>
import Header from '@/views/billboard/childCpn/header/Header';
import { getVipOrderData } from '@/network/vip';
import * as echarts from 'echarts';
import { getAllCombo } from '@/network/user';
export default {
  name: 'Order',
  components: { Header },
  data() {
    return {
      option: {},
      timeLine: [],
      orderType: [],
      m: new Map(),
      legend: []
    };
  },
  async mounted() {
    const result = await getVipOrderData();
    const combo = await getAllCombo();
    result.forEach((item, index) => {
      this.m.set(item.name, item.order);
    });
    this.legend = combo.map((item, index) => {
      return item.name;
    });
    this.timeLine = result.map((item, index) => {
      return item.name;
    });
    this.orderType = combo.map((item, index) => {
      return {
        name: item.name,
        type: 'line',
        data: result
          .map((row, index) => {
            let foo = this.m.get(row.name).find((it, i) => {
              return it.name === item.name;
            });
            if (foo) {
              return foo.count;
            } else {
              return 0;
            }
          })
          .reverse()
      };
    });
    this.option = {
      tooltip: {
        trigger: 'axis',
        backgroundColor: '#00000099',
        textStyle: {
          color: '#fff',
          fontSize: '13px'
        },
        axisPointer: {
          type: 'line',
          lineStyle: {
            type: 'solid',
            color: '#fff'
          }
        },
        confine: true
      },
      legend: {
        data: this.legend
      },
      grid: {
        top: '32%',
        bottom: '6%',
        left: '5%',
        right: '2%',
        containLabel: true
      },
      xAxis: [
        {
          type: 'category',
          data: this.timeLine.reverse(),
          axisTick: {
            interval: 0
          },
          axisLabel: {
            interval: 0
          }
        }
      ],
      yAxis: [
        {
          type: 'value',
          name: '开通数量',
          axisLine: {
            show: true,
            symbol: ['none', 'arrow'],
            symbolSize: [5, 6],
            symbolOffset: [2, 4]
          },
          axisTick: {
            show: true,
            inside: true
          },
          minInterval: 1
        }
      ],
      series: [...this.orderType]
    };
    let artistEcharts = echarts.init(document.querySelector('.order-container'));
    artistEcharts.setOption(this.option);
  }
};
</script>

<style scoped lang="less">
.order-container {
  width: 100%;
  height: 178px;
}
</style>
