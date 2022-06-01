<template>
  <div class="artist">
    <Header title="歌手" />
    <div class="artist-container"></div>
  </div>
</template>

<script>
import Header from '@/views/billboard/childCpn/header/Header';
import * as echarts from 'echarts';
import { getArtistData } from '@/network/artist';
export default {
  name: 'Artist',
  components: { Header },
  data() {
    return {
      option: {},
      artistCate: [],
      artistCateData: [],
      artistType: [],
      type: [
        {
          name: '男歌手',
          type: 'line',
          data: [],
          yAxisIndex: 1
        },
        {
          name: '女歌手',
          type: 'line',
          data: [],
          yAxisIndex: 1
        },
        {
          name: '乐队组合',
          type: 'line',
          data: [],
          yAxisIndex: 1
        }
      ]
    };
  },
  async mounted() {
    const result = await getArtistData();
    this.artistCate = result.map((item, index) => {
      return item.name;
    });
    this.artistCateData = result.map((item, index) => {
      return item.count;
    });
    this.artistType = result[0].type.map((item, index) => {
      return item.name;
    });

    this.type = this.artistType.map((item, index) => {
      return {
        name: item,
        type: 'line',
        yAxisIndex: 1,
        data: result.map((row, index) => {
          let foo = row.type.find((it, i) => {
            return it.name === item;
          });
          if (foo) {
            return foo.count;
          } else {
            return 0;
          }
        })
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
        data: ['歌手', ...this.artistType]
      },
      grid: {
        top: '32%',
        bottom: '6%',
        left: '5%',
        right: '5%',
        containLabel: true
      },
      xAxis: [
        {
          type: 'category',
          data: this.artistCate
        }
      ],
      yAxis: [
        {
          type: 'value',
          name: '歌手',
          axisLine: {
            show: true,
            symbol: ['none', 'arrow'],
            symbolSize: [5, 6],
            symbolOffset: [2, 4]
          },
          axisTick: {
            show: true,
            inside: true
          }
        },
        {
          type: 'value',
          name: '歌手类型',
          axisLine: {
            show: true,
            symbol: ['none', 'arrow'],
            symbolSize: [5, 6]
          }
        }
      ],
      series: [
        {
          name: '歌手',
          type: 'bar',
          barWidth: '38%',
          data: this.artistCateData
        },
        ...this.type
      ]
    };
    let artistEcharts = echarts.init(document.querySelector('.artist-container'));
    artistEcharts.setOption(this.option);
  }
};
</script>

<style scoped lang="less">
.artist-container {
  width: 432px;
  height: 178px;
}
</style>
