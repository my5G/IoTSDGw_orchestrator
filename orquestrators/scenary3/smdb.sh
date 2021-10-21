use free5gc
db.policyData.ues.smData.remove({})
db.policyData.ues.smData.insert({"smPolicySnssaiData" : { "01112233" : { "smPolicyDnnData" : { "internet" : { "dnn" : "internet" }, "ims" : { "dnn" : "ims" } }, "snssai" : { "sst" : 1, "sd" : "112233" } } }, "ueId" : "imsi-001010000000011" })
