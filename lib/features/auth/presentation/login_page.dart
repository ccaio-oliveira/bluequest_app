import 'package:bluequest_app/features/auth/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pwd = TextEditingController();
  final _emailRe = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  bool _loading = false;

  String? _req(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Obrigatório' : null;

  String? _emailVal(String? v) {
    if (_req(v) != null) return 'Obrigatório';
    if (!_emailRe.hasMatch(v!.trim())) return 'E-mail inválido';
    return null;
  }

  String? _pwdVal(String? v) {
    if (_req(v) != null) return 'Obrigatório';
    if (v!.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entrar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: _emailVal,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _pwd,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: _pwdVal,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() {
                          _loading = true;
                        });

                        final (user, token) = await ref.read(
                          loginUseCaseProvider,
                        )(_email.text.trim(), _pwd.text);

                        ref.read(accessTokenProvider.notifier).state = token;
                        ref.read(apiClientProvider).accessToken = token;

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Bem-vindo, ${user.displayName}!'),
                            ),
                          );
                        }

                        setState(() {
                          _loading = false;
                        });
                      },
                child: _loading
                    ? const CircularProgressIndicator()
                    : const Text('Entrar'),
              ),
              TextButton(
                onPressed: () => context.push('/register'),
                child: const Text('Não tem conta? Criar '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
