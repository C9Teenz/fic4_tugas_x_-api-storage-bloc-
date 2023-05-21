import 'package:fic4_flutter_auth_bloc/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profile/profile_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const CircularProgressIndicator();
            } else if (state is ProfileLoaded) {
              final data = state.user;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(data.avatar!)),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    data.name!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    data.role!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('no data'));
            }
          },
        ),
      ),
      floatingActionButton: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLogout) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            (context).read<ProfileBloc>().add(LogoutProfileEvent());
          },
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
