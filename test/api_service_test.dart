import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_study/service/index.dart';

void main() {
  test("api service", () async {
    // var data = await apiService.getUser('hubingym');
    // print(data);
    var data = await apiService.getRepos('hubingym', 0);
    print(data);
    expect(data, isNotNull);
  });
}
