ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

docker exec -e ORDERER_CA=$ORDERER_CA cli sh -c 'peer chaincode invoke -o orderer2.example.com:7050 --tls --cafile $ORDERER_CA --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -C mychannel -n basic -c '\''{"Args":["CreateAsset","20","red", "1","adi", "10"]}'\'''
sleep 3
docker exec cli sh -c 'peer chaincode query -C mychannel -n basic -c '\''{"Args":["GetAllAssets"]}'\'''