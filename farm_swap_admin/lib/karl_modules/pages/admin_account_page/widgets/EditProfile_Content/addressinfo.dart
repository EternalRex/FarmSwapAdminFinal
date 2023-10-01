import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({
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
              height: 200,
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
                      'Country',
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
                            'City',
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
              height: 200,
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
                      'Province',
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
                            'Zipcode',
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