import * as admin from 'firebase-admin';
import { ModuleMetadata } from '@nestjs/common/interfaces';

export type FirebaseAdminModuleOptions = admin.AppOptions;

export interface FirebaseAdminModuleAsyncOptions
  extends Pick<ModuleMetadata, 'imports'> {
  name?: string;
  useFactory: (
    ...args: any[]
  ) => Promise<FirebaseAdminModuleOptions> | FirebaseAdminModuleOptions;
  inject?: any[];
}
