import { Injectable } from '@nestjs/common';
import { createCipheriv, createDecipheriv, randomBytes } from 'crypto';
@Injectable()
export class CryptoService {
  ENCRYPTION_KEY =
    process.env.ENCRYPTION_KEY || 'abcdefghijklmnopqrstuvwxyz123456'; // Must be 256 bits (32 characters)
  IV_LENGTH = 16; // For AES, this is always 16

  async encrypt(text: string) {
    const iv = randomBytes(this.IV_LENGTH);
    const cipher = createCipheriv(
      'aes-256-cbc',
      Buffer.from(this.ENCRYPTION_KEY),
      iv
    );
    let encrypted = cipher.update(text);
    encrypted = Buffer.concat([encrypted, cipher.final()]);

    return iv.toString('hex') + ':' + encrypted.toString('hex');
  }

  async decrypt(text: string) {
    const textParts = text.split(':');
    const iv = Buffer.from(textParts.shift()!, 'hex');
    const encryptedText = Buffer.from(textParts.join(':'), 'hex');
    const decipher = createDecipheriv(
      'aes-256-cbc',
      Buffer.from(this.ENCRYPTION_KEY),
      iv
    );
    let decrypted = decipher.update(encryptedText);

    decrypted = Buffer.concat([decrypted, decipher.final()]);

    return decrypted.toString();
  }
}
