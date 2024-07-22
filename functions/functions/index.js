/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

//const {onRequest} = require("firebase-functions/v2/https");
//const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */


// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require('firebase-functions/v1');

// The Firebase Admin SDK to access Firestore.
const admin = require("firebase-admin");
admin.initializeApp();

exports.createappointment = functions.firestore
    .document('appointments/{appointmentId}')
    .onCreate( async(snap, context) => {
      // Get an object representing the document
      // e.g. {'name': 'Marie', 'age': 66}
      //const newValue = snap.data();

      // access a particular field as you would any JS property
      //const name = newValue.name;

      // perform desired operations ...
      //const snapshot = event.data;
      if (!snap) {
          console.log("No data associated with the event");
          return;
      }
      const data = snap.data();
  
      // access a particular field as you would any JS property
      const userId = data.userId;
      
    
    
       // get all admins tokens
       const adminsRef = admin.firestore().collection('users');
       const adminSnapshot = await adminsRef.where('isAdmin', '==', true).get();
       if (adminSnapshot.empty) {
         console.log('No matching documents.');
         return;
       }
       const registrationTokens = new Set();
       adminSnapshot.forEach(doc => {
         console.log(doc.id, '=>', doc.data());
         doc.data().deviceTokens.forEach(token => {
                 registrationTokens.add(token);
           });
       });

//       const userRef = db.collection('users').doc(userId);
//       const doc = await userRef.get();
//       if (!doc.exists) {
//       console.log('No such document!');
//       return;
//       } else {
//       console.log('Document data:', doc.data());
//      }
//      const registrationTokens = doc.data().deviceTokens;


      
      const message = {
        data: { message: 'new appointment request by '+data.name, appointmentId: context.params.appointmentId},
        tokens: Array.from(registrationTokens),
      };
        //send notification
      admin.messaging().sendMulticast(message)
        .then((response) => {
          console.log(response.successCount + ' messages were sent successfully');
        });

        const notification = {
          message: 'new appointment request by '+data.name,
          date: new Date(),
          isRead: false,
          appointmentId:context.params.appointmentId 
        };
        
        // Add a new document in collection "cities" with ID 'LA'
         admin.firestore().collection('notifications').doc().set(notification);

    });
  
