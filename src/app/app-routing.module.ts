import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ManifestoComponent } from './manifesto/manifesto.component';
import { MediaComponent } from './media/media.component';
import { NotesComponent } from './notes/notes.component';
import { ReferencesComponent } from './references/references.component';

const routes: Routes = [];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
