import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/classes/app_values.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/localization/l10n.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../shared/presentation/widgets/cubit_state_mixin_builder.dart';
import '../../../shared/presentation/widgets/overlays/overlays.dart';
import '../../business/entities/app_notification_entity.dart';
import '../../data/models/params/change_app_notification_save_notification_params.dart';
import '../controllers/app_notification_controller.dart';
import '../cubits/get_app_notification_list_state_cubit.dart';

part '../pages/app_notification_list_page.dart';
part '../widgets/app_notification_tile.dart';
