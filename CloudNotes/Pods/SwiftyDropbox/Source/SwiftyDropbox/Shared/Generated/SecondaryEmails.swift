///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

import Foundation

/// Datatypes and serializers for the secondary_emails namespace
open class SecondaryEmails {
    /// The SecondaryEmail struct
    open class SecondaryEmail: CustomStringConvertible {
        /// Secondary email address.
        public let email: String
        /// Whether or not the secondary email address is verified to be owned by a user.
        public let isVerified: Bool
        public init(email: String, isVerified: Bool) {
            stringValidator(maxLength: 255, pattern: "^['#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$")(email)
            self.email = email
            self.isVerified = isVerified
        }
        open var description: String {
            return "\(SerializeUtil.prepareJSONForSerialization(SecondaryEmailSerializer().serialize(self)))"
        }
    }
    open class SecondaryEmailSerializer: JSONSerializer {
        public init() { }
        open func serialize(_ value: SecondaryEmail) -> JSON {
            let output = [ 
            "email": Serialization._StringSerializer.serialize(value.email),
            "is_verified": Serialization._BoolSerializer.serialize(value.isVerified),
            ]
            return .dictionary(output)
        }
        open func deserialize(_ json: JSON) -> SecondaryEmail {
            switch json {
                case .dictionary(let dict):
                    let email = Serialization._StringSerializer.deserialize(dict["email"] ?? .null)
                    let isVerified = Serialization._BoolSerializer.deserialize(dict["is_verified"] ?? .null)
                    return SecondaryEmail(email: email, isVerified: isVerified)
                default:
                    fatalError("Type error deserializing")
            }
        }
    }

}
