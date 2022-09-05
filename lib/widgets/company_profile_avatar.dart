import 'package:flutter/material.dart';
import 'package:pwa_demo/job_model.dart';

class CompanyProfileAvatar extends StatelessWidget {
  const CompanyProfileAvatar(
      {Key? key, required this.company, this.radius = 25})
      : super(key: key);

  final double radius;
  final Company company;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: company.backgroundColor ?? Colors.grey[200]!,
      child: Icon(
        company.icon,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
