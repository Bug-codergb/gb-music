<template>
  <div class="playlist-data">
    <Header title="歌单" />
    <div class="playlist-container"></div>
  </div>
</template>

<script>
import Header from '@/views/billboard/childCpn/header/Header';
import { getPlaylistData } from '@/network/playlist';
import * as echarts from 'echarts';
export default {
  name: 'Playlist',
  components: { Header },
  data() {
    return {
      option: {},
      playlistCate: [],
      playlistCount: [],
      song: [],
      playCount: [],
      timber: null,
      startIndex: 0,
      endIndex: 4,
      total: 0
    };
  },
  mounted() {
    this.initPlaylist();
  },
  beforeDestroy() {
    clearInterval(this.timber);
  },
  methods: {
    async initPlaylist() {
      const result = await getPlaylistData();
      this.total = result.length;
      this.playlistCate = result.map((item, index) => {
        return item.name;
      });
      this.playlistCount = result.map((item, index) => {
        return item.count;
      });
      this.song = result.map((item, index) => {
        return item.song;
      });
      this.playCount = result.map((item, index) => {
        return item.playCount;
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
          data: ['歌单数量', '歌曲数', '播放量']
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
            data: this.playlistCate.slice(this.startIndex, this.endIndex),
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
            name: '歌单',
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
            name: '歌单数量',
            type: 'bar',
            data: this.playlistCount.slice(this.startIndex, this.endIndex)
          },
          {
            name: '歌曲数',
            type: 'bar',
            data: this.song.slice(this.startIndex, this.endIndex)
          },
          {
            name: '播放量',
            type: 'line',
            yAxisIndex: 1,
            data: this.playCount.slice(this.startIndex, this.endIndex),
            lineStyle: {
              color: '#ee6666'
            },
            itemStyle: {
              color: '#ee6666'
            }
          }
        ]
      };
      let playlistEcharts = echarts.init(document.querySelector('.playlist-container'));
      playlistEcharts.setOption(this.option);
      this.timber = setInterval(() => {
        this.startIndex += 1;
        this.endIndex += 1;
        if (this.endIndex > this.total) {
          this.startIndex = 0;
          this.endIndex = 4;
        }
        playlistEcharts.setOption({
          xAxis: [
            {
              type: 'category',
              data: this.playlistCate.slice(this.startIndex, this.endIndex),
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
              name: '歌单数量',
              type: 'bar',
              data: this.playlistCount.slice(this.startIndex, this.endIndex)
            },
            {
              name: '歌曲数',
              type: 'bar',
              data: this.song.slice(this.startIndex, this.endIndex)
            },
            {
              name: '播放量',
              type: 'line',
              yAxisIndex: 1,
              data: this.playCount.slice(this.startIndex, this.endIndex)
            }
          ]
        });
      }, 3100);
    }
  }
};
</script>

<style scoped lang="less">
.playlist-data {
  .playlist-container {
    width: 100%;
    height: 178px;
  }
}
</style>
