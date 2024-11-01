import 'package:flutter/material.dart';
import 'package:tt_service/features/profile/address/views/profile_address_edit.dart';
import 'package:tt_service/features/profile/address/bloc/profile_address_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_service/services/api_service.dart';
import '../../../../models/address.dart';
import 'address_textfield.dart';

class AddressBottomSheet extends StatefulWidget {
  final ProfileAddressBloc profileAddressBloc;
  final Function(AddressApi selectedAddress) onAddressSelected;

  const AddressBottomSheet({
    Key? key,
    required this.profileAddressBloc,
    required this.onAddressSelected,
  }) : super(key: key);

  @override
  _AddressBottomSheetState createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  final TextEditingController _bottomSheetAddressController = TextEditingController();

  @override
  void dispose() {
    _bottomSheetAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.profileAddressBloc,
      child: FractionallySizedBox(
        heightFactor: 0.66, // BottomSheet займет 2/3 высоты экрана
        child: SafeArea(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets, // Обработка появления клавиатуры
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Поле ввода адреса в BottomSheet
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AddressTextfield(
                    keyboardType: TextInputType.text,
                    labelText: 'Введите адрес',
                    controller: _bottomSheetAddressController,
                    onChanged: (value) {
                      // Отправляем событие для получения подсказок адресов
                      widget.profileAddressBloc.add(
                        ProfileAddressTextFieldChanged(value: value),
                      );
                    },
                  ),
                ),
                // Список подсказок адресов
                Expanded(
                  child: BlocBuilder<ProfileAddressBloc, ProfileAddressState>(
                    builder: (context, state) {
                      if (state is ProfileAddressListReceived) {
                        return ListView.builder(
                          itemCount: state.listOfAddresses.length,
                          itemBuilder: (context, index) {
                            final address = state.listOfAddresses[index];
                            return ListTile(
                              title: Text(address.address),
                              onTap: () {
                                widget.onAddressSelected(address);
                              },
                            );
                          },
                        );
                      } else if (state is ProfileAddressLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProfileAddressError) {
                        return Center(child: Text('Ошибка: ${state.message}'));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}