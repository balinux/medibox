<?php

namespace App\Filament\Resources\DrugShelfResource\Pages;

use App\Filament\Resources\DrugShelfResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageDrugShelves extends ManageRecords
{
    protected static string $resource = DrugShelfResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
