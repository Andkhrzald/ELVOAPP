import 'package:flutter/material.dart';
import '../layanan/layanan_api.dart';
import '../widget/input_elvo.dart';
import 'layar_beranda.dart';
import 'layar_daftar.dart';

class LayarLogin extends StatefulWidget {
  const LayarLogin({super.key});

  @override
  State<LayarLogin> createState() => _LayarLoginState();
}

class _LayarLoginState extends State<LayarLogin> {
  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  bool _sedangMemuat = false;
  bool _sembunyikanPassword = true;

  Future<void> _handleLogin() async {
    if (_ctrlUsername.text.isEmpty || _ctrlPassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan password wajib diisi')),
      );
      return;
    }

    setState(() => _sedangMemuat = true);
    if (!mounted) return;

    final hasil = await LayananApi.login(_ctrlUsername.text, _ctrlPassword.text);

    setState(() => _sedangMemuat = false);
    if (!mounted) return;

    if (hasil['status'] == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayarBeranda()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(hasil['message'] ?? 'Login gagal')),
      );
    }
  }

  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image/wanita_login.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/image/wanita_login.jpg',
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(color: Color.fromRGBO(0, 0, 0, 0.4)),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.08),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 0.15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 40,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'ELVO',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Selamat datang kembali',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 255, 255, 0.65),
                        ),
                      ),
                      const SizedBox(height: 36),
                      InputElvo(
                        controller: _ctrlUsername,
                        icon: Icons.person_outline,
                        hintText: 'Email / Username',
                      ),
                      const SizedBox(height: 14),
                      InputElvo(
                        controller: _ctrlPassword,
                        icon: Icons.lock_outline,
                        hintText: 'Password',
                        isPassword: true,
                        obscureText: _sembunyikanPassword,
                        onToggleObscure: () => setState(
                          () => _sembunyikanPassword = !_sembunyikanPassword,
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _sedangMemuat ? null : _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: _sedangMemuat
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: Colors.black,
                                  ),
                                )
                              : const Text(
                                  'MASUK',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun? ',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.55),
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LayarDaftar(),
                              ),
                            ),
                            child: const Text(
                              'Daftar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
