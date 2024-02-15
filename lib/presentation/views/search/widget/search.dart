part of '../search_view.dart';

final class _SearchWidget extends StatefulWidget {
  final ValueChanged<String> onSearch;
  const _SearchWidget({
    required this.onSearch,
  });

  @override
  State<_SearchWidget> createState() => _SearchWidgetState();
}

final class _SearchWidgetState extends State<_SearchWidget> {
  late final TextEditingController _textEditingController;

  /// Maximum length of the search text
  final int _maxCharacterLength = 500;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  void _onSearch() {
    final text = _textEditingController.text.trim();

    if (text.isEmpty) {
      context.showTopError(
        title: LocaleKeyConstants.pleaseEnterSearchText,
      );
      return;
    }

    if (text.length > _maxCharacterLength) {
      context.showTopError(
        title: LocaleKeyConstants.enteredLengthShouldBeAtLeast,
      );

      return;
    }

    widget.onSearch(_textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) => _onSearch(),
            controller: _textEditingController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: LocaleKeyConstants.searchPlaceholder,
              prefixIcon: const Icon(
                Icons.search,
                color: ColorConstants.iconColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
        Gap(8.w),
        ElevatedButton(
          onPressed: _onSearch,
          child: Text(LocaleKeyConstants.searchText),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
