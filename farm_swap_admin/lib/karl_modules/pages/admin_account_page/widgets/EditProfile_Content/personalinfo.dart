import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding:
                const EdgeInsets
                    .symmetric(
                    horizontal: 10,
                    vertical: 10),
            child: Container(
              height: 300,
              decoration:
                  const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets
                        .only(
                        left: 20,
                        top: 10),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      'First Name',
                      style: Poppins
                          .contentText
                          .copyWith(
                        color: const Color
                            .fromARGB(
                            255,
                            55,
                            54,
                            56),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const TextField(
                      decoration:
                          InputDecoration(
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .all(
                            Radius.circular(
                                5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets
                              .only(
                              top:
                                  10),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            'Email Address',
                            style: Poppins
                                .contentText
                                .copyWith(
                              color: const Color
                                  .fromARGB(
                                  255,
                                  55,
                                  54,
                                  56),
                            ),
                          ),
                          const SizedBox(
                            height:
                                3,
                          ),
                          const TextField(
                            decoration:
                                InputDecoration(
                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets
                              .only(
                              top:
                                  10),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            'Role',
                            style: Poppins
                                .contentText
                                .copyWith(
                              color: const Color
                                  .fromARGB(
                                  255,
                                  55,
                                  54,
                                  56),
                            ),
                          ),
                          const SizedBox(
                            height:
                                3,
                          ),
                          const TextField(
                            decoration:
                                InputDecoration(
                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding:
                const EdgeInsets
                    .symmetric(
                    horizontal: 10,
                    vertical: 10),
            child: Container(
              height: 300,
              decoration:
                  const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets
                        .only(
                        right: 20,
                        top: 10),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      'Last Name',
                      style: Poppins
                          .contentText
                          .copyWith(
                        color: const Color
                            .fromARGB(
                            255,
                            55,
                            54,
                            56),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const TextField(
                      decoration:
                          InputDecoration(
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .all(
                            Radius.circular(
                                5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets
                              .only(
                              top:
                                  10),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            'Phone Number',
                            style: Poppins
                                .contentText
                                .copyWith(
                              color: const Color
                                  .fromARGB(
                                  255,
                                  55,
                                  54,
                                  56),
                            ),
                          ),
                          const SizedBox(
                            height:
                                3,
                          ),
                          const TextField(
                            decoration:
                                InputDecoration(
                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}