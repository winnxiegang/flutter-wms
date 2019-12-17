import 'package:flutter/material.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/provider/bus_provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

class BusHeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, BusProvider value, Widget child) {
        if (value == null||value.busStationDetalEntity == null) return noDataText();
        ProviderUtils.Pro<BusProvider>(context)
            .setBusStationDetalResultBuslinesBusstop(value.busStationDetalEntity.result.buslines[0].busstops);
        return Container(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              Text(
                "公交公司:${value.busStationDetalEntity.result.buslines[0].company}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "运营时间段:${value.busStationDetalEntity.result.buslines[0].startTime.substring(0, 2) + ":" + value.busStationDetalEntity.result.buslines[0].startTime.substring(2, 4) + "--" + value.busStationDetalEntity.result.buslines[0].endTime.substring(0, 2) + ":" + value.busStationDetalEntity.result.buslines[0].endTime.substring(2, 4)}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "始发站点:${value.busStationDetalEntity.result.buslines[0].startStop}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "终点站:${value.busStationDetalEntity.result.buslines[0].endStop}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List<Widget>.generate(value.busstops.length, (i) => _stationItenWidget(context, i)),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  /// stationIten组件
  Widget _stationItenWidget(BuildContext context, int index) {
    return Container(
      child: InkWell(
        onTap: () => {ToastOk.show(msg: ProviderUtils.Pro<BusProvider>(context).busstops[index].location)},
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              color: Colors.amber,
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              (index + 1).toString(),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Column(
              children: List<Widget>.generate(ProviderUtils.Pro<BusProvider>(context).busstops[index].name.length,
                  (i) => _getTextColumListWidget(ProviderUtils.Pro<BusProvider>(context).busstops[index].name, i)),
            ),
          ],
        ),
      ),
    );
  }

  /// getTextColumList组件
  Widget _getTextColumListWidget(String itemText, int index) {
    return Text(
      itemText.substring(index, index + 1),
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }
}
