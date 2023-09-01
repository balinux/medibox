<?php

namespace App\Filament\Resources\PersonalAccessTokenResource\Pages;

use App\Filament\Resources\PersonalAccessTokenResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManagePersonalAccessTokens extends ManageRecords
{
    protected static string $resource = PersonalAccessTokenResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
