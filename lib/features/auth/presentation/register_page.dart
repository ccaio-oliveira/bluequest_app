import 'package:bluequest_app/features/auth/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pwd = TextEditingController();
  final _tz = TextEditingController(text: 'America/Sao_Paulo');
  bool _loading = false;

  String? _req(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Obrigatório' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: _req,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _req,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _pwd,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Obrigatório';
                  if (v.length < 6) return 'Mínimo 6 caracteres';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _tz,
                decoration: const InputDecoration(labelText: 'Fuso horário'),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _loading
                    ? null
                    : () async {
                        if (!_form.currentState!.validate()) return;

                        setState(() {
                          _loading = true;
                        });

                        try {
                          final (
                            user,
                            tokens,
                          ) = await ref.read(registerUseCaseProvider)(
                            email: _email.text.trim(),
                            password: _pwd.text,
                            displayName: _name.text.trim(),
                            timezone: _tz.text.trim(),
                          );

                          ref.read(accessTokenProvider.notifier).state =
                              tokens.$1;
                          ref.read(apiClientProvider).accessToken = tokens.$1;

                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Conta criada com sucesso!'),
                            ),
                          );
                          context.go('/challenges');
                        } catch (_) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Falha ao criar conta. Tente novamente.',
                                ),
                              ),
                            );
                          }
                        } finally {
                          if (mounted) {
                            setState(() {
                              _loading = false;
                            });
                          }
                        }
                      },
                child: _loading
                    ? const CircularProgressIndicator()
                    : const Text('Criar conta e continuar'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Já tem conta? Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
