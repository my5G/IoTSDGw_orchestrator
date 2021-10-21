#!/bin/bash 
 

curl --location --request POST 'http://127.0.0.1:5000/api/subscriber/imsi-2089300007486/20893' \
--header 'Content-Type: application/json' \
--data-raw '{
    "plmnID": "20893",
    "ueId": "imsi-2089300007486",
    "AuthenticationSubscription": {
        "authenticationMethod": "5G_AKA",
        "permanentKey": {
            "permanentKeyValue": "b73a90cbcf3afb622dba83c58a8415df",
            "encryptionKey": 0,
            "encryptionAlgorithm": 0
        },
        "sequenceNumber": "f1e8a523a36d",
        "authenticationManagementField": "8000",
        "milenage": {
            "op": {
                "opValue": "b672047e003bb952dca6cb8af0e5b779",
                "encryptionKey": 0,
                "encryptionAlgorithm": 0
            }
        },
        "opc": {
            "opcValue": "df0c67868fa25f748b7044c6e7c245b8",
            "encryptionKey": 0,
            "encryptionAlgorithm": 0
        }
    },
    "AccessAndMobilitySubscriptionData": {
        "gpsis": [
            "msisdn-0900000000"
        ],
        "subscribedUeAmbr": {
            "uplink": "1 Gbps",
            "downlink": "2 Gbps"
        },
        "nssai": {
            "defaultSingleNssais": [
                {
                    "sst": 1,
                    "sd": "010203"
                },
                {
                    "sst": 1,
                    "sd": "112233"
                }
            ]
        }
    },
    "SessionManagementSubscriptionData": [
        {
            "singleNssai": {
                "sst": 1,
                "sd": "010203"
            },
            "dnnConfigurations": {
                "internet": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                },
                "internet2": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                }
            }
        },
        {
            "singleNssai": {
                "sst": 1,
                "sd": "112233"
            },
            "dnnConfigurations": {
                "internet": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                },
                "internet2": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                }
            }
        }
    ],
    "SmfSelectionSubscriptionData": {
        "subscribedSnssaiInfos": {
            "01010203": {
                "dnnInfos": [
                    {
                        "dnn": "internet"
                    },
                    {
                        "dnn": "internet2"
                    }
                ]
            },
            "01112233": {
                "dnnInfos": [
                    {
                        "dnn": "internet"
                    },
                    {
                        "dnn": "internet2"
                    }
                ]
            }
        }
    },
    "AmPolicyData": {
        "subscCats": [
            "free5gc"
        ]
    },
    "SmPolicyData": {
        "smPolicySnssaiData": {
            "01010203": {
                "snssai": {
                    "sst": 1,
                    "sd": "010203"
                },
                "smPolicyDnnData": {
                    "internet": {
                        "dnn": "internet"
                    },
                    "internet2": {
                        "dnn": "internet2"
                    }
                }
            },
            "01112233": {
                "snssai": {
                    "sst": 1,
                    "sd": "112233"
                },
                "smPolicyDnnData": {
                    "internet": {
                        "dnn": "internet"
                    },
                    "internet2": {
                        "dnn": "internet2"
                    }
                }
            }
        }
    },
    "FlowRules": null
}'


curl --location --request POST 'http://127.0.0.1:5000/api/subscriber/imsi-2089300007487/20893' \
--header 'Content-Type: application/json' \
--data-raw '{
    "plmnID": "20893",
    "ueId": "imsi-2089300007487",
    "AuthenticationSubscription": {
        "authenticationMethod": "5G_AKA",
        "permanentKey": {
            "permanentKeyValue": "5122250214c33e723a5dd523fc145fc0",
            "encryptionKey": 0,
            "encryptionAlgorithm": 0
        },
        "sequenceNumber": "16f3b3f70fc2",
        "authenticationManagementField": "8000",
        "milenage": {
            "op": {
                "opValue": "c9e8763286b5b9ffbdf56e1297d0887b",
                "encryptionKey": 0,
                "encryptionAlgorithm": 0
            }
        },
        "opc": {
            "opcValue": "981d464c7c52eb6e5036234984ad0bcf",
            "encryptionKey": 0,
            "encryptionAlgorithm": 0
        }
    },
    "AccessAndMobilitySubscriptionData": {
        "gpsis": [
            "msisdn-0900000000"
        ],
        "subscribedUeAmbr": {
            "uplink": "1 Gbps",
            "downlink": "2 Gbps"
        },
        "nssai": {
            "defaultSingleNssais": [
                {
                    "sst": 1,
                    "sd": "010203"
                },
                {
                    "sst": 1,
                    "sd": "112233"
                }
            ]
        }
    },
    "SessionManagementSubscriptionData": [
        {
            "singleNssai": {
                "sst": 1,
                "sd": "010203"
            },
            "dnnConfigurations": {
                "internet": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                },
                "internet2": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                }
            }
        },
        {
            "singleNssai": {
                "sst": 1,
                "sd": "112233"
            },
            "dnnConfigurations": {
                "internet": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                },
                "internet2": {
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8,
                            "preemptCap": "",
                            "preemptVuln": ""
                        },
                        "priorityLevel": 8
                    },
                    "sessionAmbr": {
                        "uplink": "200 Mbps",
                        "downlink": "100 Mbps"
                    }
                }
            }
        }
    ],
    "SmfSelectionSubscriptionData": {
        "subscribedSnssaiInfos": {
            "01010203": {
                "dnnInfos": [
                    {
                        "dnn": "internet"
                    },
                    {
                        "dnn": "internet2"
                    }
                ]
            },
            "01112233": {
                "dnnInfos": [
                    {
                        "dnn": "internet"
                    },
                    {
                        "dnn": "internet2"
                    }
                ]
            }
        }
    },
    "AmPolicyData": {
        "subscCats": [
            "free5gc"
        ]
    },
    "SmPolicyData": {
        "smPolicySnssaiData": {
            "01010203": {
                "snssai": {
                    "sst": 1,
                    "sd": "010203"
                },
                "smPolicyDnnData": {
                    "internet": {
                        "dnn": "internet"
                    },
                    "internet2": {
                        "dnn": "internet2"
                    }
                }
            },
            "01112233": {
                "snssai": {
                    "sst": 1,
                    "sd": "112233"
                },
                "smPolicyDnnData": {
                    "internet": {
                        "dnn": "internet"
                    },
                    "internet2": {
                        "dnn": "internet2"
                    }
                }
            }
        }
    },
    "FlowRules": null
}'
