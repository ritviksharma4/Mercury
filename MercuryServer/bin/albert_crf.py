from test.predict import predict
import argparse
import json
from test.predict import predict
from word2number import w2n

prediction = {}

class AlbertCRF(object):

    def findIntentSlot():
        clientFile = open("File: 'ClientMsg.txt'", "r")
        clientMsg = clientFile.read()
        clientFile.close()

        sendFile = open("IntentSlot.json", "w")

        parser = argparse.ArgumentParser()

        parser.add_argument("--input_sent", default=clientMsg, type=str,
                            help="Input sentence for prediction")
        parser.add_argument("--model_dir", default="./albert_fine_tuned", type=str, help="Path to save, load model")

        parser.add_argument("--batch_size", default=32, type=int, help="Batch size for prediction")
        parser.add_argument("--no_cuda", action="store_true", help="Avoid using CUDA when available")

        intentSlotConfig = parser.parse_args()
        global prediction
        prediction = predict(intentSlotConfig)

        sendFile.write(json.dumps(prediction, sort_keys=False, indent=2))
        sendFile.close()


    def sendOrderDetails():
        clientMsgJSON = prediction

        send2ClientFile = open("OrderDetails.txt", "w")

        if (clientMsgJSON['intent'] == 'OrderFood'):
            orderLength = len(clientMsgJSON['slots']['qty'])
            for index in range(orderLength):

                if (index == 0):
                    send2ClientFile.write("********ORDER DETAILS********\n\n")

                if (clientMsgJSON['slots']['food_type'][index] == ''):
                    send2ClientFile.write(str(clientMsgJSON['slots']['qty'][index]) + ' ' + clientMsgJSON['slots']['food_name'][index]
                     + '\n')

                else:
                    send2ClientFile.write(str(clientMsgJSON['slots']['qty'][index]) + ' ' + clientMsgJSON['slots']['food_type'][index]
                    + ' ' + clientMsgJSON['slots']['food_name'][index] + '\n')
                
            send2ClientFile.write("\n" + clientMsgJSON['slots']['restaurant_name'] + " has received your order!")



if __name__ == '__main__':
    AlbertCRF.findIntentSlot()
    AlbertCRF.sendOrderDetails()