import 'package:flutter/material.dart';
import '../layanan/layanan_api.dart';
import '../widget/input_elvo.dart';

class LayarDaftar extends StatefulWidget {
  const LayarDaftar({super.key});

  @override
  State<LayarDaftar> createState() => _LayarDaftarState();
}

class _LayarDaftarState extends State<LayarDaftar> {
  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final TextEditingController _ctrlKonfirmasi = TextEditingController();
  bool _sedangMemuat = false;
  bool _sembunyikanPassword = true;
  bool _sembunyikanKonfirmasi = true;

  Future<void> _handleDaftar() async {
    final username = _ctrlUsername.text.trim();
    final email = _ctrlEmail.text.trim();
    final password = _ctrlPassword.text;
    final konfirmasi = _ctrlKonfirmasi.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty || konfirmasi.isEmpty) {
      _tampilPesan('Semua field wajib diisi');
      return;
    }

    if (username.length < 3) {
      _tampilPesan('Username minimal 3 karakter');
      return;
    }

    if (!email.contains('@')) {
      _tampilPesan('Format email tidak valid');
      return;
    }

    if (password.length < 6) {
      _tampilPesan('Password minimal 6 karakter');
      return;
    }

    if (password != konfirmasi) {
      _tampilPesan('Konfirmasi password tidak cocok');
      return;
    }

    setState(() => _sedangMemuat = true);
    if (!mounted) return;

    final hasil = await LayananApi.daftar(username, email, password);

    setState(() => _sedangMemuat = false);
    if (!mounted) return;

    if (hasil['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Akun berhasil dibuat, silakan login'),
          backgroundColor: Color.fromRGBO(46, 125, 50, 1),
        ),
      );
      Navigator.pop(context);
    } else {
      _tampilPesan(hasil['message'] ?? 'Pendaftaran gagal');
    }
  }

  void _tampilPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    _ctrlKonfirmasi.dispose();
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
                        'Buat akun baru',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 255, 255, 0.65),
                        ),
                      ),
                      const SizedBox(height: 36),
                      InputElvo(
                        controller: _ctrlUsername,
                        icon: Icons.person_outline,
                        hintText: 'Username',
                      ),
                      const SizedBox(height: 14),
                      InputElvo(
                        controller: _ctrlEmail,
                        icon: Icons.email_outlined,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
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
                      const SizedBox(height: 14),
                      InputElvo(
                        controller: _ctrlKonfirmasi,
                        icon: Icons.lock_outline,
                        hintText: 'Konfirmasi Password',
                        isPassword: true,
                        obscureText: _sembunyikanKonfirmasi,
                        onToggleObscure: () => setState(
                          () => _sembunyikanKonfirmasi = !_sembunyikanKonfirmasi,
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _sedangMemuat ? null : _handleDaftar,
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
                                  'DAFTAR',
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
                            'Sudah punya akun? ',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.55),
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text(
                              'Masuk',
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
