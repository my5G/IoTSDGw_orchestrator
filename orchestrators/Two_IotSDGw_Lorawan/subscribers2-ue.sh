#!/bin/bash 

curl --location --request POST 'http://127.0.0.1:5000/api/subscriber/imsi-2089300007486/20893' \
--header 'Content-Type: application/json' \
--data-raw '{
    "plmnID": "20893",
    "ueId": "imsi-2089300007486",
    "AuthenticationSubscription": {
        "authenticationManagementField": "8000",
        "authenticationMethod": "5G_AKA",
        "milenage": {
            "op": {
                "encryptionAlgorithm": 0,
                "encryptionKey": 0,
                "opValue": "df0c67868fa25f748b7044c6e7c245b8"
            }
        },
        "opc": {
            "encryptionAlgorithm": 0,
            "encryptionKey": 0,
            "opcValue": ""
        },
        "permanentKey": {
            "encryptionAlgorithm": 0,
            "encryptionKey": 0,
            "permanentKeyValue": "b73a90cbcf3afb622dba83c58a8415df"
        },
        "sequenceNumber": "f1e8a523a36d"
    },
    "AccessAndMobilitySubscriptionData": {
        "gpsis": [
            "msisdn-0900000000"
        ],
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
            ],
            "singleNssais": [
                {
                    "sst": 1,
                    "sd": "010203"
                },
                {
                    "sst": 1,
                    "sd": "112233"
                }
            ]
        },
        "subscribedUeAmbr": {
            "downlink": "2 Gbps",
            "uplink": "1 Gbps"
        }
    },
    "SessionManagementSubscriptionDataList": [
        {
            "singleNssai": {
                "sst": 1,
                "sd": "010203"
            },
            "dnnConfigurations": {
                "internet": {
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_1",
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sessionAmbr": {
                        "uplink": "2 Gbps",
                        "downlink": "1 Gbps"
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8
                        },
                        "priorityLevel": 8
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
                    "sscModes": {
                        "defaultSscMode": "SSC_MODE_1",
                        "allowedSscModes": [
                            "SSC_MODE_1",
                            "SSC_MODE_2",
                            "SSC_MODE_3"
                        ]
                    },
                    "pduSessionTypes": {
                        "defaultSessionType": "IPV4",
                        "allowedSessionTypes": [
                            "IPV4"
                        ]
                    },
                    "sessionAmbr": {
                        "uplink": "2 Gbps",
                        "downlink": "1 Gbps"
                    },
                    "5gQosProfile": {
                        "5qi": 9,
                        "arp": {
                            "priorityLevel": 8
                        },
                        "priorityLevel": 8
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
                    }
                ]
            },
            "01112233": {
                "dnnInfos": [
                    {
                        "dnn": "internet"
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
                    }
                }
            }
        }
    }
}'
