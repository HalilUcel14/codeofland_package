library codeofland;

export 'sources/base_model/base_model.dart';
export 'sources/base_model/firestore_model.dart';
export 'sources/exception/cloud_firestore_exception.dart';

///--------------------------------------------------
export 'sources/exception/custom_exception.dart';
export 'sources/exception/firebase_auth_exception.dart';
export 'sources/exception/firebase_storage_exception.dart';

///--------------------------------------------------
export 'sources/extension/context/navigator_extension.dart';
export 'sources/extension/context/other_function_extension.dart';
export 'sources/extension/context/scaffold_messenger_extension.dart';
export 'sources/extension/context/screen_size_extension.dart';
export 'sources/extension/context/theme_extension.dart';

///
export 'sources/extension/numeric/numeric_extension.dart';
export 'sources/extension/numeric/padding_extension.dart';
export 'sources/extension/string/convert_money_extension.dart';
export 'sources/extension/string/language_model_extension.dart';

///
export 'sources/extension/string/nullable_extension.dart';
export 'sources/extension/string/regexp_extension.dart';
export 'sources/extension/string/string_extension.dart';
export 'sources/extension/string/text_space_extension.dart';

///
export 'sources/extension/text_style/font_weight_extension.dart';
export 'sources/extension/widget/widget_extension.dart';
export 'sources/firebase/authentication/firebase_auth_manager.dart';

///------------------------------------------------------------
/// ---------------------- [FİREBASE]--------------------------
///------------------------------------------------------------

// -----------------------[AUTH]---------------------------
export 'sources/firebase/authentication/firebase_auth_service.dart';
// -----------------------[CLOUD]---------------------------
export 'sources/firebase/cloud_firestore/cloud_firestore_manager.dart';
export 'sources/firebase/cloud_firestore/cloud_firestore_service.dart';
// -----------------------[CLOUD]---------------------------
export 'sources/firebase/storage/firebase_storage_manager.dart';
export 'sources/firebase/storage/firebase_storage_service.dart';
// -----------------------[MODEL]---------------------------
export 'sources/model/cloud_firestore_model.dart';
export 'sources/model/language_model.dart';

///------------------------------------------------------------
/// ---------------------- [OTHER]--------------------------
///------------------------------------------------------------
export 'sources/other/text_input_formatter.dart';
export 'widget/animate/animated_slide_route.dart';

///------------------------------------------------------------
/// ---------------------- [WİDGET]--------------------------
///------------------------------------------------------------
export 'widget/dialog/custom_show_dialog.dart';
export 'widget/with_spacing/column_with_spacing.dart';
export 'widget/with_spacing/row_with_spacing.dart';

// Add this line in your pubspec.yaml
// Change Readme add File;
