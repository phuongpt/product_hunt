import 'package:product_hunt/app/app.dart';
import 'package:product_hunt/bootstrap.dart';
import 'package:product_hunt/data/repositories/repository.dart';

void main() {
  bootstrap(() => App(repository: Repository()));
}
