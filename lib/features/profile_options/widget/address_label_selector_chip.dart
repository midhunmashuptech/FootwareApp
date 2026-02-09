import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile_options/cubit/add_address_state.dart';
import 'package:footware_app/features/profile_options/cubit/add_adrress_cubit.dart';
import 'package:footware_app/features/profile_options/widget/add_label_bottom_modal.dart';

/// 🏷 LABEL SELECTOR WITH CUBIT
class AddressLabelSelector extends StatelessWidget {
  const AddressLabelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Label", style: textTheme.titleSmall),
        const SizedBox(height: 10),
        BlocBuilder<AddressFormCubit, AddressFormState>(
          builder: (context, state) {
            return Wrap(
              spacing: 10,
              children: [
                ...state.labels.map(
                  (label) => _LabelChip(
                    label: label,
                    selectedLabel: state.selectedLabel,
                  ),
                ),
                const _AddLabelButton(),
              ],
            );
          },
        ),
      ],
    );
  }
}

/// 🔘 SINGLE CHIP
class _LabelChip extends StatelessWidget {
  final String label;
  final String selectedLabel;

  const _LabelChip({required this.label, required this.selectedLabel});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isSelected = selectedLabel == label;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      showCheckmark: false,
      onSelected: (_) => context.read<AddressFormCubit>().selectLabel(label),
      selectedColor: colors.primary,
      labelStyle: TextStyle(
        color: isSelected ? colors.onPrimary : colors.onSurface,
      ),
      backgroundColor: colors.surface,
      shape: StadiumBorder(
        side: BorderSide(color: colors.onSurface.withOpacity(0.2)),
      ),
    );
  }
}

/// ➕ ADD LABEL BUTTON
class _AddLabelButton extends StatelessWidget {
  const _AddLabelButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        final cubit = context.read<AddressFormCubit>(); // get cubit FIRST

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => BlocProvider.value(
            value: cubit, // provide SAME cubit to sheet
            child: const AddLabelSheet(),
          ),
        );
      },

      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: colors.onSurface.withOpacity(0.3)),
        ),
        child: Icon(Icons.add, size: 18, color: colors.onSurface),
      ),
    );
  }
}
