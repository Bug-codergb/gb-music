<template>
  <div class="video-data">
    <Header title="视频" />
    <div class="video-container"></div>
  </div>
</template>

<script>
import Header from '@/views/billboard/childCpn/header/Header';
import * as echarts from 'echarts';
import { getVideoData } from '@/network/video';
export default {
  name: 'Video',
  components: { Header },
  data() {
    return {
      option: {},
      videoCate: [],
      playCount: [],
      thumbs: [],
      sub: [],
      count: [],
      total: 0,
      startIndex: 0,
      endIndex: 4,
      timber: null
    };
  },
  mounted() {
    this.initVideoData();
  },
  beforeDestroy() {
    clearInterval(this.timber);
  },
  methods: {
    async initVideoData() {
      const result = await getVideoData();
      this.videoCate = result.map((item, index) => {
        return item.name;
      });
      this.total = result.length;
      this.playCount = result.map((item, index) => {
        return item.playCount;
      });
      this.thumbs = result.map((item, index) => {
        return item.thumb;
      });
      this.sub = result.map((item, index) => {
        return item.subscriber;
      });
      this.count = result.map((item, index) => {
        return item.count;
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
          data: ['视频数量', '点赞数', '收藏数', '播放量']
        },
        grid: {
          top: '32%',
          bottom: '6%',
          left: '3%',
          right: '3%',
          containLabel: true
        },
        dataZoom: {
          show: false,
          start: 0,
          end: 100
        },
        xAxis: [
          {
            type: 'category',
            data: this.videoCate.slice(0, 4),
            axisTick: {
              interval: 0
            },
            axisPointer: {
              type: 'shadow'
            },
            axisLabel: {
              interval: 0
            }
          }
        ],
        yAxis: [
          {
            type: 'value',
            name: '视频',
            axisLine: {
              show: true,
              symbol: ['none', 'arrow'],
              symbolSize: [5, 6]
            }
          },
          {
            type: 'value',
            name: '播放量',
            axisLine: {
              show: true,
              symbol: ['none', 'arrow'],
              symbolSize: [5, 6]
            }
          }
        ],
        series: [
          {
            name: '视频数量',
            type: 'bar',
            data: this.count.slice(this.startIndex, this.endIndex)
          },
          {
            name: '点赞数',
            type: 'bar',
            data: this.thumbs.slice(this.startIndex, this.endIndex)
          },
          {
            name: '收藏数',
            type: 'bar',
            data: this.sub.slice(this.startIndex, this.endIndex)
          },
          {
            name: '播放量',
            type: 'line',
            yAxisIndex: 1,
            data: this.playCount.slice(this.startIndex, this.endIndex)
          }
        ]
      };
      let videoEcharts = echarts.init(document.querySelector('.video-container'));
      videoEcharts.setOption(this.option);
      this.timber = setInterval(() => {
        this.startIndex += 1;
        this.endIndex += 1;
        if (this.endIndex > this.total) {
          this.startIndex = 0;
          this.endIndex = 4;
        }
        videoEcharts.setOption({
          xAxis: [
            {
              type: 'category',
              data: this.videoCate.slice(this.startIndex, this.endIndex),
              axisTick: {
                interval: 0
              },
              axisPointer: {
                type: 'shadow'
              },
              axisLabel: {
                interval: 0
              }
            }
          ],
          series: [
            {
              name: '视频数量',
              type: 'bar',
              data: this.count.slice(this.startIndex, this.endIndex)
            },
            {
              name: '点赞数',
              type: 'bar',
              data: this.thumbs.slice(this.startIndex, this.endIndex)
            },
            {
              name: '收藏数',
              type: 'bar',
              data: this.sub.slice(this.startIndex, this.endIndex)
            },
            {
              name: '播放量',
              type: 'line',
              yAxisIndex: 1,
              data: this.playCount.slice(this.startIndex, this.endIndex)
            }
          ]
        });
      }, 3500);
    }
  }
};
</script>

<style scoped lang="less">
.video-container {
  width: 100%;
  height: 178px;
}
</style>
