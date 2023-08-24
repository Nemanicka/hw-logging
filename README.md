# Results

## Setup

1. MySQL DB - the "slow logging" is achieved by setting up a very small "slow threshold", so every insert is considered slow.
2. EL stack - Elastic + Logstash, without Kibana, since on my PC it's quite challanging to up the whole setup due to the lack of resources.
3. Filebeat + Graylog + Opensearch. In my setup there is a need to set graylog's input manually via web interface.
4. TIG stack for monitoring.

## The process

Here is the initial state of the system, there is a very big spike in CPU consumption caused by start of the system, let's scale it down later
![Graphana_begin](https://i.imgur.com/jG91Tqp.png)

The system after 90 sec of 2-threaded load
![Graphana_2](https://i.imgur.com/Cv5DOde.png)

The system after 90 sec of 2-threaded load, 3d thread is just added.
![Graphana_3](https://i.imgur.com/ayw2hKp.png)

The system after 180 sec of 3-threaded load.
![Graphana_4](https://i.imgur.com/sttHvZb.png)

The logs in opensearch, via graylog
![Accessing from the US region](https://i.imgur.com/iNbqD0e.png)

The logs in elastic, via logstash
![Accessing from the US region](https://i.imgur.com/zYqdmvO.png)


## Conclusions:
**CPU**: Elastic consumes 3x CPU as opensearch, but graylog consumes almost the same CPU as logstash. Also, elastic spiked twice, and the biggest spike was right after starting 3d thread. 

**RAM**: Both elastic and logstash steadily consume 1.5-2x more RAM than opensearch + graylog.

**Traffic**: Both opensearch and graylog consume 2-3x more traffic than logstash and elastic due to the different logging format and abundance of metadata.

**DIsk IO**: Ungortunatelly, in my setup disk io metrics are not available, perhapes due to issues in the graphana boards - 
I've tried several ones, but others can't show ever RAM & CPU.
Overall, I expect disk io to be similar to traffic consumption.
